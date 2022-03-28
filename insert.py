import csv
import mysql.connector

key = open('C:\Users\dzysi\OneDrive\Documents\PORTFOLIO\Prestamos-Personales\key.txt')

#me contecto a la base
conexion = mysql.connector.connect(host = "localhost", 
                                   database = "prestamos_personales", 
                                   user = "root", 
                                   password = key)
cursor = conexion.cursor()

#armo la tabla a mandar
with open("PRESTAMOS.csv") as csv_file:
    file = csv.reader(csv_file, delimiter = ';')
    next(file)
    values = [tuple(row) for row in file]
    
#inserto la tabla a mandar 

query = "INSERT INTO prestamos (id,id_capital,id_cliente,id_pago,monto,interes,n_cuotas,refinanciacion,coment) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
cursor.executemany(query, values)
conexion.commit()
cursor.close()
conexion.close()



