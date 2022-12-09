class Note
  attr_accessor :title, :tag, :rank, :time, :edit_time

  def initialize(title, tag, rank)
    @title = title
    @tag = tag
    @rank = rank
    @time = Time.now.utc
    @edit_time = nil
  end

  def to_s
    "title: #{@title}, tag: #{@tag}, create time: #{@time}, edit time #{@time}, rank: #{@rank}"
  end
end


class Picture<Note
  attr_accessor :src

  def initialize(title, tag, rank)
    super
    @src
  end

  def edit(src)
    @src=src
    @edit_time=Time.now.utc
  end

  def to_s
    "#{super.to_s}, src: #{@src}"
  end
end

class Text<Note
  attr_accessor :text

  def initialize(title, tag, rank)
    super
    @text
  end

  def edit(text)
    @text=text
    @edit_time=Time.now.utc
  end

  def to_s
    "#{super.to_s}, text: #{@text}"
  end
end

class List<Note
  attr_accessor :list

  def initialize(title, tag, rank)
    super
    @list = Array.new
  end

  def add(elem)
    @list.push(elem)
  end

  def edit(list)
    @list=list
    @edit_time=Time.now.utc
  end

  def to_s
    "#{super.to_s}, list: #{@list}"
  end
end

class Content
  def initialize
    @notes = Array.new
  end

  def add(note)
    @notes.push(note)
  end

  def find_by_tag(tag)
    @notes.find_all do |n|
      n.tag == tag
    end
  end

  def find_by_time(start_time, end_time)
    @notes.find_all do |n|
      n.time>=start_time && n.time<=end_time
    end
  end

  def sort_by_title
    @notes = @notes.sort{|a,b| a.title<=>b.title}
  end

  def sort_by_rank
    @notes = @notes.sort_by(&:rank)
  end

  def to_s
    result = ""
    @notes.each { |n|
      result += "#{n}\n"
    }
    result += "--------------------------------------------------------------"

    result
  end
end


content = Content.new
text = Text.new("ruby exam", "ruby",1)
text.text = "I am doing this task at 2am"
content.add(text)
text = Text.new("reason", "reason",1)
text.text = "I did not have electricity and internet"
content.add(text)
text = Text.new("Lorem ipsum", "text",3)
text.text = "Lorem ipsum text"
content.add(text)
text = Text.new("My text", "text",2)
text.text = "Some text"
content.add(text)


picture = Picture.new("text","text", 5 )
picture.src = "text.png"
content.add(picture)
picture = Picture.new("Lando Norris","norris", 7 )
picture.src = "lando.jpeg"
content.add(picture)
picture = Picture.new("pic","pic", 4)
picture.src = "pic.png"
content.add(picture)

list = List.new("purchases","groceries",3)
list.list = %w[apple orange bread juice]
content.add(list)
list = List.new("List of tasks","tasks",1)
list.list = ["write ruby exam","sleep","write distributed computing labs","sleep"]
content.add(list)

picture.edit("oscar.png")
text.edit("edited text")
list.edit(%w[task1 task2 task3 task4])
list.add("task5")

puts content.find_by_tag("text")
puts "--------------------------------------------------------------"
puts content.find_by_time(Time.new(2022,1,1,0,0,0),Time.now)
puts "--------------------------------------------------------------"

puts content
content.sort_by_title
puts content
content.sort_by_rank
puts content