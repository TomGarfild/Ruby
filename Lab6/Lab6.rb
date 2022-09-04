class Student
  attr_reader :last_name
  attr_reader :first_name
  attr_reader :middle_name
  attr_reader :sex
  attr_reader :age
  attr_reader :year

  def initialize(last_name, first_name, middle_name, sex, age, year)
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @sex = sex
    @age = age
    @year = year
  end
end

class StudentDepartment
  @@students = []

  @@years_total = Hash.new(0)
  @@years_men = Hash.new(0)

  @@men_names = Hash.new(0)
  @@women_names = Hash.new(0)

  @@women_ages = Hash.new(0)

  def StudentDepartment.add_student(student)
    @@students.push(student)
    @@years_total[student.year] += 1
    @@years_men[student.year] += 1 if student.sex
    @@men_names[student.first_name] += 1 if student.sex
    @@women_names[student.first_name] += 1 unless student.sex
    @@women_ages[student.age] += 1 unless student.sex
  end

  def StudentDepartment.print_year_with_most_men_percentage
    if @@students.empty?
      puts no_students
    else
      max = 0
      years = []
      @@years_total.each do |year, count|
        value = 100.0*@@years_men[year]/count
        if value > max
          max = value
          years = [year]
        elsif value == max
          years.push(year)
        end
      end
      puts "Years with most men percentage #{max}%:"
      years.each { |y| print "#{y} year; " }
      puts
    end
  end

  def StudentDepartment.print_most_popular_names(sex)
    if @@women_ages.empty?
      puts no_students
    else
      puts "Most popular #{converted_sex(sex)} names:"
      names = sex ? @@men_names.each { |name, v| print "#{name}; " if v == @@men_names.values.max }
                  : @@women_names.each { |name, v| print "#{name}; " if v == @@women_names.values.max }
      puts
    end
  end

  def StudentDepartment.print_women_students_with_most_popular_age
    if @@students.empty?
      puts no_students
      return
    end
    max_count = @@women_ages.values.max
    ages = @@women_ages.select {|age, count| age if count == max_count}
    puts "Women with most popular age:"
    @@students.select { |s| !s.sex && (ages.include? s.age) }
              .map { |s| get_name_initials(s) }
              .sort
              .each { |name| print "#{name}; " }
  end

  private
  def StudentDepartment.converted_sex(sex)
    sex ? "men" : "women"
  end

  private
  def StudentDepartment.no_students
    "Add at least one student"
  end

  private
  def StudentDepartment.get_name_initials(student)
    "#{student.last_name} #{student.first_name[0]}. #{student.middle_name[0]}."
  end
end

StudentDepartment.add_student(Student.new("Safroniuk", "Oleksii", "Serhiyovych", true, 19, 3))
StudentDepartment.add_student(Student.new("Ivanov", "Ivan", "Ivanovich", true, 17, 1))
StudentDepartment.add_student(Student.new("Petrov", "Ivan", "Ivanovich", true, 18, 2))
StudentDepartment.add_student(Student.new("Petrov", "Petro", "Petrovych", true, 20, 3))
StudentDepartment.add_student(Student.new("Kelley", "Lucy", "Ivanivna", false, 21, 3))
StudentDepartment.add_student(Student.new("Clarke", "Hannah", "Semenovna", false, 19, 2))
StudentDepartment.add_student(Student.new("Norris", "Sophie", "Volodymyrivna", false, 18, 2))
StudentDepartment.add_student(Student.new("Norris", "Sophie", "Ivanivna", false, 18, 2))

StudentDepartment.print_year_with_most_men_percentage
StudentDepartment.print_most_popular_names(true)
StudentDepartment.print_most_popular_names(false)
StudentDepartment.print_women_students_with_most_popular_age