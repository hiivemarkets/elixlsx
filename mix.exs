defmodule Elixlsx.Mixfile do
  use Mix.Project

  @source_url "https://github.com/xou/elixlsx"
  @version "0.6.0"

  def project do
    [
      app: :elixlsx,
      version: @version,
      elixir: "~> 1.12",
      package: package(),
      description: "Elixlsx is a writer for the MS Excel OpenXML format (`.xlsx`).",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [extra_applications: [:xmerl]]
  end

  defp deps do
    [
      {:excheck, "~> 0.5", only: :test},
      {:floki, "~> 0.36.2", only: [:dev, :test]},
      {:triq, "~> 1.3.0", only: :test},
      {:credo, "~> 1.7.7", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: [:dev], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:sweet_xml, "~> 0.7.1", only: :test},
      {:propcheck, "~> 1.4", only: [:dev, :test]}
    ]
  end

  defp docs do
    [
      extras: ["CHANGELOG.md", "README.md"],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end

  defp package do
    [
      maintainers: ["Nikolai Weh <niko.weh@gmail.com>"],
      licenses: ["MIT"],
      links: %{
        "Changelog" => "https://hexdocs.pm/elixlsx/changelog.html",
        "GitHub" => @source_url
      }
    ]
  end
end
