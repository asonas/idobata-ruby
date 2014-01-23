module Idobata
  class Support
    def self.deploy_notification(user_name: "anonymous", application_name: "", revision_url: "", revision: "")
      source = "[DEPLOY] #{user_name} deployed a new version of #{application_name}"
      source += " (deployed revision: <a href=#{revision_url} target='_blank'>#{revision[0..8]}</a>)" unless revision.empty?
      Idobata.client.post(format: :html, source: source)
    end
  end
end
