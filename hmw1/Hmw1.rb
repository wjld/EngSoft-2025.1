class Hmw1
    def self.part1
        puts 'Now running part 1...'
        puts "    a) #{p1a ? 'success':'failed'}"
        puts "    b) #{p1b ? 'success':'failed'}"
    end

    def self.part2
        puts 'Now running part 2...'
        puts "    a) #{p2a ? 'success':'failed'}"
        puts "    b) #{p2b ? 'success':'failed'}"
    end

    def self.part3
        puts 'Now running part 3...'
        puts "    a) #{p3a ? 'success':'failed'}"
    end

    def self.part4
        puts 'Now running part 4...'
        puts "    a) #{p4a ? 'success':'failed'}"
        puts "    b) #{p4b ? 'success':'failed'}"
    end

    def self.part5
        puts 'Now running part 5...'
        puts "    a) #{p5a ? 'success':'failed'}"
    end

    def self.part6
        puts 'Now running part 6...'
        puts "    a) #{p6a ? 'success':'failed'}"
        puts "    b) #{p6b ? 'success':'failed'}"
        puts "    c) #{p6c ? 'success':'failed'}"
    end

    def self.part7
        puts 'Now running part 7...'
        puts "    a) #{p7a ? 'success':'failed'}"
    end

    private

    def self.p1a
        [['A man, a plan, a canal -- Panama', true],
        ["Madam, I'm Adam!", true],
        ['Abracadabra', false]]
        .all?{|s, b| palindrome?(s) == b}
    end

    def self.p1b
        [['A man, a plan, a canal -- Panama',
        {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}],
        ['Doo bee doo bee doo',
        {'doo' => 3, 'bee' => 2}]]
        .all?{|s,l| count_words(s) == l}
    end

    class WrongNumberOfPlayersError < StandardError; end
    class NoSuchStrategyError < StandardError; end

    def self.p2a
        winners = [
            [[['Kristen', 'P'], ['Pam', 'S']],['Pam', 'S']],
            [[['Kristen', 'R'], ['Pam', 'S']],['Kristen', 'R']],
            [[['Kristen', 'R'], ['Pam', 'p']],['Pam', 'p']],
            [[['Kristen', 'S'], ['Pam', 'S']],['Kristen', 'S']]
        ].all?{|g, w| rps_game_winner(g) == w}
        if winners
            begin
                rps_game_winner([['Pam', 'r']])
            rescue WrongNumberOfPlayersError
            end
            begin
                rps_game_winner([['Kristen', 'j'], ['Pam', 's']])
            rescue NoSuchStrategyError
            end
            begin
                rps_game_winner([['Kristen', 'R'], ['Pam']])
            rescue NoSuchStrategyError
            end
            true
        end
        winners
    end

    def self.p2b
        [
            [
                [
                    [
                        [['Kristen', 'P'], ['Dave', 'S']],
                        [['Richard', 'R'], ['Michael', 'S']],
                    ],
                    [
                        [['Allen', 'S'], ['Omer', 'P']],
                        [['David E.', 'R'], ['Richard X.', 'P']]
                    ]
                ], ['Richard', 'R']
            ],
            [
                [
                    [
                        [
                            [['Alice', 'R'], ['Bob', 'P']],
                            [['Charlie', 'S'], ['Diana', 'R']],
                        ],
                        [
                            [['Eve', 'P'], ['Frank', 'S']],
                            [['Grace', 'R'], ['Hank', 'P']]
                        ],
                    ],
                    [
                        [
                            [['Sophia', 'P'], ['Liam', 'S']],
                            [['Olivia', 'R'], ['Noah', 'P']]
                        ],
                        [
                            [['Emma', 'S'], ['James', 'R']],
                            [['Ava', 'P'], ['Lucas', 'S']]
                        ]
                    ]
                ], ['James', 'R']
            ]
        ].all?{|t, w| rps_tournament_winner(t) == w}
    end

    def self.p3a
            [
                [['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams',
                'scream'],
                [['cars', 'racs', 'scar'],['for'],['potatoes'],['four'],
                ['creams', 'scream']]]
            ].all?{|w, l| combine_anagrams(w) == l}
    end

    def self.p4a
        desserts = [Dessert.new('cake', 200), Dessert.new('pie', 199),
                    Dessert.new('ice cream', 3000),]
        healthy = [false, true, false]
        delicious = [true, true, true]
        desserts.zip(healthy).all?{|d, b| d.healthy? == b}\
        && desserts.zip(delicious).all?{|d, b| d.delicious? == b}
    end

    def self.p4b
        jellybeans = [JellyBean.new('jellybean', 100, 'black licorice'),
                      JellyBean.new('jellybean', 100, 'cherry'),
                      JellyBean.new('jellybean', 100, 'vanilla'),]
        healthy = [true, true, true]
        delicious = [false, true, true]
        jellybeans.zip(healthy).all?{|j, b| j.healthy? == b}\
        && jellybeans.zip(delicious).all?{|j, b| j.delicious? == b}
    end

    def self.p5a
        f = Foo.new
        f.bar = 1
        f.bar = 2
        g = Foo.new
        g.bar = 3
        g.bar = :lsp
        g.bar = 'str'
        h = Foo.new
        i = Foo2.new
        i.ber = '1'
        i.bir = 2
        i.ber = 3
        i.bir = 'thirty-five'
        f.bar_history == [nil, 1, 2] && g.bar_history == [nil, 3, :lsp, 'str']\
        && h.bar_history == [nil] && i.ber_history == [nil, '1', 3] \
        && i.bir_history == [nil, 2, 'thirty-five']
    end

    def self.p6a
        begin
            [
                [3.yen.in(:euros), 0.030185758513931887],
                [7.euros.in(:dollars), 9.044],
                [4.dollars.in(:yen), 307.6923076923077],
                [1.dollar.in(:dollars), 1],
                [1.rupee.in(:yen), 1.4615384615384617],
                [2.rupees.in(:euros), 0.029411764705882353],
                [4.in(:yen).in(:euros), 0.04024767801857585],
                [4.in(:rupees), 4],
            ].all?{|v, i| v == i}
        rescue ArgumentError
            false
        end
    end

    def self.p6b
        [['A man, a plan, a canal -- Panama', true],
        ["Madam, I'm Adam!", true],
        ['Abracadabra', false]]
        .all?{|s, b| s.palindrome? == b}
    end

    def self.p6c
        [
            [[1, 2, 3, 2, 1], true],
            [[1, 2, 3, 4, 5], false],
            [['a', 'b', 'c', 'b', 'a'], true],
            [['a', 'b', 'c'], false]
        ].all? {|e, b| palindrome?(e) == b}
    end

    def self.p7a
        c0 = CartesianProduct.new([1, 2, 3],[4, 5, 6])
        result0 = []
        c0.each { |elt| result0 << elt }
        expected0 = [[1, 4], [1, 5], [1, 6], [2, 4], [2, 5], [2, 6], [3, 4],
                     [3, 5], [3, 6]]
        c1 = CartesianProduct.new([:a, :b], [4, 5])
        result1 = []
        c1.each { |elt| result1 << elt }
        expected1 = [[:a, 4], [:a, 5], [:b, 4], [:b, 5]]
        c2 = CartesianProduct.new([:a, :b], [])
        result2 = []
        c2.each { |elt| result2 << elt }
        expected2 = []

        [result0, result1, result2].zip([expected0, expected1, expected2])
        .all?{|c, r| c == r}
    end

    def self.palindrome?(s)
        s = s.is_a?(Enumerable) && !s.is_a?(String)\
            ? s.to_a: s.gsub(/[^a-zA-Z]/, '').downcase
        s == s.reverse
    end

    def self.count_words(s)
        s = s.downcase.scan(/\b\w+\b/)
        s.each_with_object(Hash.new(0)) do |word, hash| hash[word] += 1
        end
    end

    def self.rps_game_winner(players)
        raise WrongNumberOfPlayersError unless players.is_a?(Array)\
                                            && players.size == 2\
                                            && players.all?{|p| p.is_a?(Array)}
        p1, p2 = players
        raise NoSuchStrategyError unless [p1[1], p2[1]]
                                         .all?{|s| s&.match?(/\A[RPS]\z/i)}
        ranks = { 'R' => 0, 'P' => 1, 'S' => 2 }
        if p1[1].upcase == p2[1].upcase
            return p1
        elsif (ranks[p1[1].upcase] - ranks[p2[1].upcase]) % 3 == 1
            return p1
        else
            return p2
        end
    end

    def self.rps_tournament_winner(tournament)
        if tournament[0].is_a?(Array) && tournament[0][0].is_a?(Array)
            tournament = tournament.map{|t| rps_tournament_winner(t)}
        end
        rps_game_winner(tournament)
    end

    def self.combine_anagrams(words)
        words.group_by{|w| w.downcase.chars.sort}.values
    end
end

class Dessert
    def initialize(name, calories)
        @name = name
        @calories = calories
    end

    def healthy?
        @calories < 200
    end

    def delicious?
        true
    end
end

class JellyBean < Dessert
    def initialize(name, calories, flavor)
        super(name, calories)
        @flavor = flavor
    end

    def delicious?
        if @flavor == 'black licorice'
            false
        else
            super
        end
    end
end

class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s
        attr_reader attr_name
        attr_reader "#{attr_name}_history"
        class_eval do
            define_method("#{attr_name}=") do |value|
                unless instance_variable_defined?("@#{attr_name}_history")
                    instance_variable_set("@#{attr_name}_history", [nil])
                end
                instance_variable_get("@#{attr_name}_history") << value
                instance_variable_set("@#{attr_name}", value)
            end

            define_method("#{attr_name}_history") do
                instance_variable_get("@#{attr_name}_history") || [nil]
            end
        end
    end
end

class Foo
    attr_accessor_with_history :bar
end

class Foo2
    attr_accessor_with_history :ber
    attr_accessor_with_history :bir
end

class Numeric
    @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292,
                    'rupee' => 0.019}

    def method_missing(method_id)
        currency = method_id.to_s.chomp('s')
        @@currencies.key?(currency) ? CurrencyWrapper.new(self, currency)
                                    : super
    end

    def in(target_currency)
        currency = target_currency.to_s.chomp('s')
        @@currencies.key?(currency) ? CurrencyWrapper.new(self, currency)
                                    : super
    end
end

class CurrencyWrapper
    attr_reader :value, :currency

    def initialize(value, currency)
        @value = value
        @currency = currency
    end

    def ==(other)
        return self == other if other.is_a?(CurrencyWrapper)
        return @value == other if other.is_a?(Numeric)
        false
    end

    def in(target_currency)
        currency = target_currency.to_s.chomp('s')
        Numeric.class_variable_get(:@@currencies).key?(currency) ?
            convert_currency(currency)
            : raise(ArgumentError, 'Unknown currency: #{target_currency}')
    end

    def method_missing(method_id, *args, &block)
        currency = method_id.to_s.chomp('s')
        if Numeric.class_variable_get(:@@currencies).key?(currency)
            convert_currency(currency)
        elsif @value.respond_to?(method_id)
            result = @value.public_send(method_id, *args, &block)
            result.is_a?(Numeric) ? CurrencyWrapper.new(result, @currency)
                                  : result
        else
            super
        end
    end

    private

    def convert_currency(target)
        currencies = Numeric.class_variable_get(:@@currencies)
        converted = @value * currencies[@currency] / currencies[target]
        CurrencyWrapper.new(converted, target)
    end
end

class String
    def palindrome?
        Hmw1.send(:palindrome?, self)
    end
end

class CartesianProduct
    include Enumerable

    def initialize(seq1, seq2)
        @seq1 = seq1
        @seq2 = seq2
    end

    def each
        return enum_for(:each) unless block_given?

      @seq1.each do |item1|
            @seq2.each do |item2|
                yield [item1, item2]
            end
        end
    end
end

puts "let's homework!"
Hmw1.part1
Hmw1.part2
Hmw1.part3
Hmw1.part4
Hmw1.part5
Hmw1.part6
Hmw1.part7
puts 'homeworked!'