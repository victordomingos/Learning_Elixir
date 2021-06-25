defmodule NpkstuffWeb.IMCController do
  use NpkstuffWeb, :controller

  alias Npkstuff.IMC

  def index(conn, params)  do
    params
    |> IMC.calcular
    |> tratar_resposta(conn)

    # IO.inspect(params)
    # IO.inspect(conn)

    # conn
    # |> text("teste")
  end

  def tratar_resposta({:ok, resultado}, conn) do
    gerar_resposta(conn, resultado, :ok)
  end

  def tratar_resposta({:error, resultado}, conn) do
    gerar_resposta(conn, resultado, :bad_request)
  end

  defp gerar_resposta(conn, resultado, status)  do
    conn
    |> put_status(status)
    |> json(%{"resultado" => resultado})
  end

end
