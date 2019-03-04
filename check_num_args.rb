# Class that checks to make sure that the number of arguments is correct
class CheckNumArgs
  def check_args(args)
    args.count == 3 && ((args[0].to_i).kind_of? Integer) && args[1].to_i > 0 && args[2].to_i > 0
  rescue StandardError
    false
  end
end
