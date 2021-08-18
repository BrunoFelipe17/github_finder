defmodule GithubFinder.GithubAPI.ClientTest do
  use ExUnit.Case, async: true

  import GithubFinder.Factory

  alias GithubFinder.GithubAPI.Client
  alias GithubFinder.Error

  describe "user_repos/2" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "when the username is valid, returns user's repos", %{bypass: bypass} do
      username = "BrunoFelipe17"

      url = endpoint_url(bypass.port)

      body = build(:user_repos_body)

      Bypass.expect(bypass, "GET", "#{username}/repos", fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response = Client.user_repos(url, username)

      expected_response = {
        :ok,
        [
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/APS-POTA",
            "id" => 151_988_859,
            "name" => "APS-POTA",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/BrunoFelipe17",
            "id" => 396_011_376,
            "name" => "BrunoFelipe17",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/CodeSignalKotlin",
            "id" => 322_642_673,
            "name" => "CodeSignalKotlin",
            "stargazers_count" => 0
          },
          %{
            "description" => "Project by Jetbrains Academy",
            "html_url" => "https://github.com/BrunoFelipe17/CoffeeMachine",
            "id" => 267_732_563,
            "name" => "CoffeeMachine",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/coppercon",
            "id" => 395_788_017,
            "name" => "coppercon",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/daily_meals",
            "id" => 391_787_345,
            "name" => "daily_meals",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/estudiokb",
            "id" => 394_419_423,
            "name" => "estudiokb",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/ExLivery",
            "id" => 385_257_903,
            "name" => "ExLivery",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/exmeal",
            "id" => 392_069_641,
            "name" => "exmeal",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/exmeal_associations",
            "id" => 396_823_843,
            "name" => "exmeal_associations",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/flightex",
            "id" => 389_135_979,
            "name" => "flightex",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/freela_reports",
            "id" => 385_052_648,
            "name" => "freela_reports",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/freela_reports_parallel",
            "id" => 385_241_445,
            "name" => "freela_reports_parallel",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/github_finder",
            "id" => 397_377_169,
            "name" => "github_finder",
            "stargazers_count" => 0
          },
          %{
            "description" => "Identicon written in Elixir",
            "html_url" => "https://github.com/BrunoFelipe17/identicon",
            "id" => 133_185_815,
            "name" => "identicon",
            "stargazers_count" => 0
          },
          %{
            "description" => "Degree Project for Compilers Module",
            "html_url" => "https://github.com/BrunoFelipe17/KotlinAntlrProject",
            "id" => 310_168_625,
            "name" => "KotlinAntlrProject",
            "stargazers_count" => 1
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/list_filter",
            "id" => 384_553_494,
            "name" => "list_filter",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/list_length",
            "id" => 384_552_536,
            "name" => "list_length",
            "stargazers_count" => 0
          },
          %{
            "description" => "Jogo criado para os alunos do Infantil 4 da Escola Móbile",
            "html_url" => "https://github.com/BrunoFelipe17/Memory-game",
            "id" => 249_815_028,
            "name" => "Memory-game",
            "stargazers_count" => 0
          },
          %{
            "description" => "Draw flowers using mathematics",
            "html_url" => "https://github.com/BrunoFelipe17/Phyllotaxis",
            "id" => 155_025_385,
            "name" => "Phyllotaxis",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/PongPong",
            "id" => 306_517_627,
            "name" => "PongPong",
            "stargazers_count" => 1
          },
          %{
            "description" => "My personal website",
            "html_url" => "https://github.com/BrunoFelipe17/portfolio",
            "id" => 290_828_470,
            "name" => "portfolio",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/reports_generator",
            "id" => 384_575_625,
            "name" => "reports_generator",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/ripa",
            "id" => 394_762_165,
            "name" => "ripa",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/rockelivery",
            "id" => 391_783_672,
            "name" => "rockelivery",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/scratch_login_generator",
            "id" => 392_426_267,
            "name" => "scratch_login_generator",
            "stargazers_count" => 0
          },
          %{
            "description" => nil,
            "html_url" => "https://github.com/BrunoFelipe17/site-inscricoes-porto",
            "id" => 261_204_105,
            "name" => "site-inscricoes-porto",
            "stargazers_count" => 0
          },
          %{
            "description" => "Sums all elements of a list",
            "html_url" => "https://github.com/BrunoFelipe17/SumList",
            "id" => 384_502_638,
            "name" => "SumList",
            "stargazers_count" => 0
          },
          %{
            "description" => "Aplicação elixir feita durante o NLW",
            "html_url" => "https://github.com/BrunoFelipe17/Wabanex",
            "id" => 379_100_005,
            "name" => "Wabanex",
            "stargazers_count" => 0
          }
        ]
      }

      assert response == expected_response
    end

    test "when the username is not found, returns an error", %{bypass: bypass} do
      username = "BrunoFelipe111"

      url = endpoint_url(bypass.port)

      body_response = ~s({
        "message": "Not Found",
        "documentation_url": "https://docs.github.com/rest/reference/repos#list-repositories-for-a-user"
        })

      Bypass.expect(bypass, "GET", "#{username}/repos", fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.resp(404, body_response)
      end)

      response = Client.user_repos(url, username)

      expected_response = {:error, Error.build_user_not_found()}

      assert expected_response == response
    end

    test "when there is a generic server error, returns an error", %{bypass: bypass} do
      username = "BrunoFelipe17"

      url = endpoint_url(bypass.port)

      Bypass.down(bypass)

      response = Client.user_repos(url, username)

      assert {:error, %Error{result: _reason, status: :bad_request}} = response
    end

    defp endpoint_url(port), do: "http://localhost:#{port}/"
  end
end
