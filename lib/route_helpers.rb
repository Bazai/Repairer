class ActionDispatch::Routing::Mapper

    def ajax_resources(*args)
    args.each do |res|
      post "#{res}/create"
      post "#{res}/update"
      get "#{res}/new"
      get "#{res}/edit"
      delete "#{res}/destroy"
    end
  end
end