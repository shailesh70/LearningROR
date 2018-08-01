class EmailFilter
  class << self

    def [](email)
      domain = extractDomain(email)
      redis.hexists(hash, domain)
    end

    def []=(domain, val)
      redis.hset(hash, domain, val)
    end

    def all_v
      redis.hkeys(hash)
    end

    def delete(domain)
      redis.hdel(hash, domain)
    end

    private

      def redis
        $redis
      end

      def hash
        "email_filter"
      end

      def extractDomain(email)
        email.split('@').last
      end

  end
end