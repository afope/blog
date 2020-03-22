require Logger

defmodule BlogWeb.CounterLive do
  use Phoenix.LiveView

  def mount(_session, socket) do
    socket = assign(socket, :counter, 0)
    {:ok, socket}
  end

  def render(assigns) do
    Logger.info("RENDER #{inspect(self())}")
    ~L"""
    <label>Counter:  <%= @counter %></label>
    <button phx-click="incr">+</button>
    """
  end

  def handle_event("incr", _event, socket) do
    Logger.info("clicked!!! now")
    socket = update(socket, :counter, &(&1 + 1))
    {:noreply, socket}
  end
end
