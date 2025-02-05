require './test/integration_helper'

class NitpickTest < MiniTest::Unit::TestCase

  def teardown
    Mongoid.reset
  end

  def test_nitpicking_a_submission_saves_a_nit
    exercise = Exercise.new('nong', 'one')
    submission = Submission.on(exercise)
    nitpicker = User.new(username: 'burtlo')
    Nitpick.new(submission.id, nitpicker, 'Too many variables').save
    nit = submission.reload.nits.first
    assert_equal 'Too many variables', nit.comment
  end

end
