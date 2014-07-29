class SecretController < ApplicationController
 before_filter :authenticate
 def index
  render text: "shh its a secret"
 end
end
