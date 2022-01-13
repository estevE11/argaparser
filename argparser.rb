class Argument
    @@name = ''
    @@short = ''
    @@desc = ''
    @@required = false

    def initialize(name, short, desc, required=false)
        @name = name
        @short = short
        @desc = desc
        @required = required
    end

    def get_name()
        return @name
    end

    def get_short()
        return @short
    end

    def get_desc()
        return @desc
    end

    def is_required()
        return @required
    end
end

class ArgParser
    @@arguments = []

    def initialize()
        @arguments = []
    end

    def add(name, short, desc, required=false)
        newarg = Argument.new(name, short, desc, required)
        @arguments.push(newarg)
    end

    def argparse()
        if ARGV[0] == '-h'
            print_help()
            return
        end
        res = {}
        for i in (0...ARGV.length()).step(2)
            res[ARGV[i][1]] = ARGV[i+1]
        end
        return res
    end

    def print_help()
        for i in (0...@arguments.length())
            puts('-' + @arguments[i].get_short() + ' ' + @arguments[i].get_name() + ': ' + @arguments[i].get_desc())
        end
    end
end


# test
if __FILE__ == $0
    argparser = ArgParser.new()
    argparser.add('time', 't', 'Set the video length', false)
    argparser.add('pause', 'p', 'Set the pause time', false)
    argparser.add('acc', 'a', 'Set acceleration rate', false)
    args = argparser.argparse()
    puts(args)
end