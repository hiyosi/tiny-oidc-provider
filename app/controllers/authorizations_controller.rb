# -*- coding: utf-8 -*-
class AuthorizationsController < ApplicationController

  require 'oidc/request'
  require 'oidc/response'

  before_action :authenticate_user!

  def new
    @req = OIDC::Request.new(params)
    if @req.valid?
      render :new
      return
    end

    if (params[:redirect_uri].present? &&
        Application.has_redirect_uri(params[:client_id], params[:redirect_uri]))
      redirect_to params[:redirect_uri] + '#' + @req.error.response.to_param
    else
      render json:
        {:error => @req.error.name,
        :error_description => @req.error.description}
    end
  end

  # 同意画面からPOSTされる先
  def create
    res = OIDC::Response.new(params)
    res.owner = current_user

    response.location = res.build_response
    render :nothing => true, :status => 302
  end

end
