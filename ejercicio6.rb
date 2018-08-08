# Ejercicio 6: Mixins.
# Crear una clase Student con un método constructor que recibirá 3 argumentos (nombre, nota1 y nota2). Cada una de las notas tendrá, por defecto, valor 4 en el caso que no se ingrese una nota al momento de crear una nueva instancia.
#
# La clase también debe tener una variable de clase llamada quantity la que será iniciada en 0 y se incrementará en 1 cada vez que se instancie un nuevo objeto.
#
# Crear un módulo Test con un método result. Este método debe calcular el promedio de 2 notas y si ese promedio es superior a 4 entregrar un mensaje que debe decir "Estudiante aprobado". En caso contrario, enviará un mensaje "Estudiante reprobado".
#
# Crear un segundo módulo Attendance con un método student_quantity que permita mostrar en pantalla la cantidad de estudiantes creados.
#
# Añadir a la clase Student el módulo Test como métodos de instancia y el módulo Attendance como métodos de clase.
#
# Crear 10 objetos de la clase Student y utilizar los métodos creados para saber si los alumnos están aprobados o no y, finalmente, mostrar el total de alumnos creados.

module Test
  def result
    average = (score1 + score2) / 2.0
    puts average > 4 ? "Estudiante aprobado" : "Estudiante reprobado"
  end
end
 module Attendance
  def student_quantity
    puts "Estudiantes creados: #{quantity}"
  end
end
 class Student
  include Test
  extend Attendance
   attr_reader :score1, :score2
  @@quantity = 0
  def initialize(name, score1 = 4, score2 = 4)
    @name = name
    @score1 = score1
    @score2 = score2
    @@quantity += 1
  end
   def self.quantity
    @@quantity
  end
end
 students = []
students << ["Pipe", 6, 3]
students << ["Jorge", 5, 2]
students << ["Marcelo", 2, 7]
students << ["Damian", 4, 2]
students << ["Susana", 7, 7]
students << ["Leo", 4, 2]
students << ["Dani", 5, 6]
students << ["Gabriela", 5, 7]
students << ["Tomas", 4, 4]
students << ["Vladimir", 4, 4]
 students.each { |s| Student.new(*s).result}
Student.student_quantity
