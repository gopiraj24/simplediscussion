defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug Ueberauth
  alias Discuss.User
  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    IO.inspect auth
    user_params = %{token: auth.credentails.token, email: auth.unfo.email, provider: auth.provider}
    changeset = User.changeset(%User{}, user_params) 
  end
end
