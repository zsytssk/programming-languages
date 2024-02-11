class Hello
    def my_first_method
        puts "hello, world!"
    end
end

x = Hello.new
x.my_first_method


class A
    def initialize(f)
        @foo = f
    end
    def m1
        @foo = 0
    end
    public def m2 x
        @foo += x
        @bar = 0
    end
    private def foo
        @foo
    end
    def bar
        @bar
    end
end

class B
    def m1
        34
    end
    def m2 x
        x.abs * 2 + self.m1
    end
end
