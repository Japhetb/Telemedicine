defmodule TelemedicineWeb.Router do
  use TelemedicineWeb, :router

  pipeline :api do
    plug CORSPlug
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug TelemedicineWeb.Auth.Pipeline
  end

  scope "/api", TelemedicineWeb do
    pipe_through [:api, :auth]
    resources "/doctors", DoctorController, except: [:new, :edit]
    resources "/patients", PatientController, except: [:new, :edit]
  end

  scope "/api", TelemedicineWeb do
    pipe_through :api
    post "/doctors/signup", DoctorController, :create
    post "/doctors/signin", DoctorController, :signin
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: TelemedicineWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
