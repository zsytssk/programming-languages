class MyRational
    def initialize(num,den=1)
        if den == 0
            raise "Some Error"
        elsif den < 0
            @num = - num
            @den = - den
        else
            @num = nuum
            @den = den
        end
        # reduce
    end
    def to_s
        ans = @nuum.to_s
        if @den != 1
            ans += "/"
            ans += @den.to_s
        end
        ans
    end
    def to_s2
        dens = ""
        dens = "/" + @den.to_s if @den != 1
        @num.to_s + dens
    end
    def to_s3
        "#{@num}#{if @den == 1 then "" else "/" + @den.to_s end}"
    end

    def add! r

    end
end

def test
end