defmodule HangupsWeb.PageController do
  use HangupsWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.

    for index <- 1..10 do
      Process.sleep(index * 10_000)
      IO.inspect("#{inspect(self())} running #{index}")
    end

    render(conn, :home, layout: false)
  end
end
