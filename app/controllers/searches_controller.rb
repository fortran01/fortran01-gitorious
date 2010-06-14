# encoding: utf-8
#--
#   Copyright (C) 2010 Marko Peltola <marko@markopeltola.com>
#   Copyright (C) 2010 Tero Hänninen <tero.j.hanninen@jyu.fi>
#   Copyright (C) 2009 Nokia Corporation and/or its subsidiary(-ies)
#   Copyright (C) 2008 Johan Sørensen <johan@johansorensen.com>
#   Copyright (C) 2008 Tor Arne Vestbø <tavestbo@trolltech.com>
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU Affero General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU Affero General Public License for more details.
#
#   You should have received a copy of the GNU Affero General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#++

class SearchesController < ApplicationController
  helper :all
  renders_in_global_context
  
  def show
    unless params[:q].blank?
      @search = Ultrasphinx::Search.new({
        :query => params[:q], :page => (params[:page] || 1),
        :per_page => 30,
      })
      @search.run
      @results = @search.results.delete_if do |result|
        (result.respond_to?("visibility_collaborators?") && result.visibility_collaborators?) ||
        (result.respond_to?("visibility_logged_in?")     && result.visibility_logged_in? && !logged_in?)
      end
    end
  rescue Ultrasphinx::UsageError
    @results = []
  end
  
end
