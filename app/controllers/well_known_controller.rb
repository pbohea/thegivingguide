class WellKnownController < ApplicationController
  # No auth, no layout
  protect_from_forgery with: :null_session

  def apple
    aasa = {
      applinks: {
        apps: [],
        details: [
          {
            appID: "3FB4FK9UPC.co.barchord.BarChord",
            paths: ["*"]
          }
        ]
      }
    }

    # Important: serve WITHOUT .json extension but WITH JSON content type
    render json: aasa, content_type: "application/json"
  end
end
