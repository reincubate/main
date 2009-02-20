require File.dirname(__FILE__) + '/../spec_helper'

describe "The catch keyword" do  
  it "only allows symbols and strings" do
    lambda { catch(:foo) {} }.should_not raise_error
    lambda { catch("foo") {} }.should_not raise_error
    lambda { catch 1 }.should raise_error(ArgumentError)    
    lambda { catch Object.new }.should raise_error(TypeError)    
  end

  it "returns the last value of the block if it nothing is thrown" do
    catch(:exit) do      
      :noexit
    end.should == :noexit
  end
  
  it "matches strings as symbols" do
    lambda { catch("exit") { throw :exit } }.should_not raise_error
    lambda { catch("exit") { throw "exit" } }.should_not raise_error
  end

  it "requires a block" do
    lambda { catch :foo }.should raise_error(LocalJumpError)
  end

  it "supports nesting" do
    i = []
    catch(:exita) do
      i << :a
      catch(:exitb) do
        i << :b
        throw :exita
        i << :after_throw
      end
      i << :b_exit
    end
    i << :a_exit

    i.should == [:a,:b,:a_exit]
  end

  it "supports nesting with the same name" do
    i = []
    catch(:exit) do
      i << :a
      catch(:exit) do
        i << :b
        throw :exit,:msg
      end.should == :msg
      i << :b_exit
    end.should == [:a,:b,:b_exit]
    i << :a_exit

    i.should == [:a,:b,:b_exit,:a_exit]
  end  
end