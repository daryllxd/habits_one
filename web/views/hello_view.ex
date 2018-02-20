defmodule HabitsOne.HelloView do
  use HabitsOne.Web, :view

  def habits do
    [
      'Weigh yourself',
      'Write 3 things to be grateful for',
      'Meditate',
      'Writing Prompt',
      'Take a dump'
    ]
  end
end
