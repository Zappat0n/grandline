module TurboStreamActionsHelper
  def reset_value(target)
    turbo_stream_action_tag(:reset_value, target: target)
  end

  def focus(target)
    turbo_stream_action_tag(:focus, target: target)
  end
end

Turbo::Streams::TagBuilder.prepend(TurboStreamActionsHelper)
