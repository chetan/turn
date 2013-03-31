module Turn

  #
  class TestMethod
    attr_accessor :name
    attr_accessor :file
    attr_accessor :raised
    attr_accessor :message
    attr_accessor :backtrace
    attr_accessor :passed
    attr_accessor :assertions
    attr_accessor :runtime

    def initialize(name)
      @name      = name
      @fail      = false
      @error     = false
      @skip      = false
      @raised    = nil
      @message   = nil
      @backtrace = []
      @passed    = false
      @assertions = 0
    end

    def fail!(assertion)
      @fail, @error, @skip = true, false, false
      @raised    = assertion
      @message   = assertion.message
      @backtrace = assertion.backtrace
    end

    def error!(exception)
      @fail, @error, @skip = false, true, false
      @raised    = exception
      @message   = exception.message
      @backtrace = exception.backtrace
    end

    def skip!(assertion)
      @fail, @error, @skip = false, false, true
      @raised    = assertion
      @message   = assertion.message
      @backtrace = assertion.backtrace
    end

    def fail?  ; @fail  ; end
    def error? ; @error ; end
    def skip?  ; @skip  ; end

    # TODO: should this include `or @skip`?
    def pass?  ; @passed ; end

    def to_s ; name ; end
  end

end

