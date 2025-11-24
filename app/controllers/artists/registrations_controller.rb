class Artists::RegistrationsController < Devise::RegistrationsController
  # GET /artists/sign_up
  def new
    super
  end

  def create
    super do |artist|
      # Don't track session or set remember_me on creation
      # User needs to confirm email first
      if artist.persisted?
        # The confirmation email will be sent automatically by Devise
        # Don't sign them in or track session yet
      end
    end
  end

  # PUT /artists
  def update
    super
  end

  protected

  # This fires AFTER successful sign up, but since confirmable blocks sign in,
  # the user will be redirected to sign in page with a notice
  def after_sign_up_path_for(resource)
    new_artist_session_path
  end

  # This fires after confirmation (handled by ConfirmationsController)
  def after_confirmation_path_for(resource_name, resource)
    artist_dashboard_path
  end

  def after_update_path_for(resource)
    artist_dashboard_path
  end

  private

  def track_artist_session(artist)
    cookies.permanent.encrypted[:artist_id] = artist.id
    Current.artist = artist if defined?(Current)
  end

  def sign_up_params
    params.require(:artist).permit(
      :username, :email, :password, :password_confirmation,
      :genre, :performance_type, :website, :instagram_username, :youtube_username, 
      :tiktok_username, :spotify_artist_id, :image, :bio
    )
  end

  def account_update_params
    params.require(:artist).permit(
      :username, :email, :password, :password_confirmation, :current_password,
      :genre, :performance_type, :website, :instagram_username, :youtube_username, 
      :tiktok_username, :spotify_artist_id, :image, :bio
    )
  end
end
