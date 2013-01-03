# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone

require 'princely/pdf_helper'

Mime::Type.register 'application/pdf', :pdf

ActionController::Base.send(:include, PdfHelper)