class CurrentTime
  include Interactor

  def call
    context.current_time = Time.now.to_s
  end
end
