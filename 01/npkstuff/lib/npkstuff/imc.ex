defmodule Npkstuff.IMC do
  def calcular(%{"filename" => nome_ficheiro}) do
    nome_ficheiro
    |> File.read()
    |> tratar_ficheiro
  end

  defp tratar_ficheiro({:ok, conteudo}) do
    dados =
      conteudo
      |> String.split("\n")
      |> Enum.map(fn linha -> processar_linha(linha) end)
      |> Enum.into(%{})

    {:ok, dados}
  end

  defp tratar_ficheiro({:error, _motivo}) do
    {:error, "Erro ao abrir o ficheiro"}
  end

  defp processar_linha(linha) do
    linha
    |> String.split(",")
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calcular_imc
  end

  defp calcular_imc([nome, altura, peso]) do
    {nome, peso / (altura * altura)}
  end
end
