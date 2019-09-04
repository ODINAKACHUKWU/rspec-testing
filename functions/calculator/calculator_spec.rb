require 'rspec'
require_relative 'calculator'

# The 'let' method will create a reusable object while the 'subject' method creates only one object which is meant to be an instance of the main object being tested.

# NOTE: 'let' method is lazy. It means that the object won’t be created until the first time you use it. To avoid these side-effects, use the 'let!' method which is non-lazy. So the object will be created before any tests are run.
describe Calculator do
    # Testing hooks
    before(:all) { puts "Preparing to test..." }
    after(:all) { puts "All tests completed!" }
    before(:each) { puts "Test started..." }
    after(:each) { puts "Test completed..." }

    let(:calculator) { Calculator.new }
    # subject(:calculator) { Factorial.new }
    # subject { Factorial.new }

    it "finds the factorial of 5" do
        expect(calculator.factorial_of(5)).to eq(120)
        # expect(subject.factorial_of(5)).to eq(120)
    end

    it "finds the square of 6" do
        expect(calculator.square_of(6)).to eq(36)
    end

    it "finds the product of 6 and 3" do
        expect(calculator.product_of(6, 3)).to eq(18)
    end

    it "greets John Doe" do
        expect(calculator.greet("John Doe")).to eq("Hello John Doe!")
    end

    # Skip block
    xit "greets Anthony Walter" do
        expect(calculator.greet("Anthony Walter")).to eq("Hello Anthony Walter!")
    end
end

# describe Course do
#     context "when user is logged in" do
#         it "displays the course lessons" do
#         end

#         it "displays the course description" do
#         end
#     end

#     context "when user is NOT logged in" do
#         it "redirects to login page" do
#         end

#         it "shows a message" do
#         end
#     end
# end
