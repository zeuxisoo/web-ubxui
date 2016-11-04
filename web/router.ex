defmodule Ubxui.Router do

    use Ubxui.Web, :router

    pipeline :browser do
        plug :accepts, ["html"]
        plug :fetch_session
        plug :fetch_flash
        plug :protect_from_forgery
        plug :put_secure_browser_headers
    end

    pipeline :api do
        plug :accepts, ["json"]
        plug Guardian.Plug.VerifyHeader, realm: "Bearer"
        plug Guardian.Plug.LoadResource
    end

    pipeline :api_authentication do
        plug Guardian.Plug.EnsureAuthenticated, handler: Ubxui.Authorizations.ErrorHandler
        plug Ubxui.Authorizations.SuccessHandler
    end

    # Web
    scope "/", Ubxui do
        pipe_through :browser

        get "/", PageController, :index
    end

    # Api
    scope "/api", Ubxui.Api do
        pipe_through :api

        scope "/auth" do
            get "/login", AuthController, :login
            get "/logout", AuthController, :logout
        end

        scope "/user" do
            pipe_through :api_authentication

            get "/profile", UserController, :profile
        end
    end

end
