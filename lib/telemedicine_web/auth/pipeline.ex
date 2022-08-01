defmodule TelemedicineWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :telemedicine,
    module: TelemedicineWeb.Auth.Guardian,
    error_handler: TelemedicineWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
