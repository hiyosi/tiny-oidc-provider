# -*- coding: utf-8 -*-
class AuthorizationsController < ApplicationController

  require 'oidc/request'
  require 'oidc/response'

  before_action :authenticate_user!

  def new
    @req = OIDC::Request.new(params)
    if @req.valid?
      render :new
    else
      #MEMO: redirect_uri が正しければエラーレスポンスはリダイレクトしてあげたほうがよい
      render json: @req.error
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
