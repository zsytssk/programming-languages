class Hello
    def my_first_method
        puts "hello, world!"
    end
end

x = Hello.new
x.my_first_method


class A
    def m1
        34
    end
    def m2 (x, y)
        z = 7
        if x > y
            false
        else
            x + y * z
        end
    end
end

y = A.new

y.m2(10, 12)