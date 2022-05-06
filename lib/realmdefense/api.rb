# frozen_string_literal: true

module RealmDefense
  ##
  # API
  class API
    def initialize
      @client = Client.new
    end

    ##
    # Returns true if the API server available
    def available?
      @client.get('/') == 'OK'
    rescue StandardError
      false
    end

    ##
    # Returns Android's version information
    def version_android
      data = @client.post('/v5/static/VERSION_Android', '{}')
      data.split("\n")
    end

    def time
      @client.get('/v5/time')
    end

    def save
      @client.get('/v5/save')
    end

    def loadsave
      @client.get('/v5/loadsave')
    end

    def message_list
      @client.get('/v5/message/list')
    end

    def comment_list
      @client.get('/v5/comment/list')
    end

    def tournament_query
      @client.get('/v5/tournament/query')
    end

    def tournament_score
      @client.get('/v5/tournament/score')
    end

    def tournament_leaderboard
      @client.get('/v5/tournament/leaderboard')
    end

    def tn_alpha_test_config
      @client.get('/v5/static/tn_alpha_test_config')
    end

    def tn_season_start_date
      @client.get('/v5/static/tn/season_start_date')
    end

    def tn_season_end_news
      @client.get('/v5/static/tn/season_end_news')
    end

    def tn_whitelist
      @client.get('/v5/static/tn_whitelist')
    end

    def mail_new_inbox_reward
      @client.get('/v5/static/mail/newInboxReward')
    end

    def mail_quick_rewards
      @client.get('/v5/static/mail/quickRewards')
    end

    def bundle_magus
      @client.get('/v5/static/bundle/magus')
    end

    def event_april_fools
      @client.get('/v5/static/event/april_fools')
    end

    def event_summer_skin
      @client.get('/v5/static/event/summerSkin')
    end

    def event_divine_star
      @client.get('/v5/static/event/divine_star')
    end
  end
end
