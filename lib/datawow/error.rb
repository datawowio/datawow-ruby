module Datawow

  # Custom error class for rescuing from all API errors
  class Error < StandardError; end

  # Raised when API returns the HTTP status code 400
  class BadRequest < Error; end

  # Raised when API returns the HTTP status code 403
  class NotPermitted < Error; end

  # Raised when API returns the HTTP status code 404
  class NotFound < Error; end

end
