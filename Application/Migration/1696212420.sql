CREATE FUNCTION set_updated_at_to_now() RETURNS TRIGGER AS $$BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;$$ language PLPGSQL;
CREATE TABLE play_results (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    consent BOOLEAN NOT NULL,
    play_data JSONB NOT NULL,
    player_name TEXT NOT NULL,
    app_name TEXT NOT NULL
);
CREATE TABLE players (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);
ALTER TABLE players ADD CONSTRAINT players_name_key UNIQUE(name);
CREATE TABLE apps (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);
ALTER TABLE apps ADD CONSTRAINT apps_name_key UNIQUE(name);
CREATE INDEX play_results_created_at_index ON play_results (created_at);
CREATE TRIGGER update_play_results_updated_at BEFORE UPDATE ON play_results FOR EACH ROW EXECUTE FUNCTION set_updated_at_to_now();
CREATE INDEX players_created_at_index ON players (created_at);
CREATE TRIGGER update_players_updated_at BEFORE UPDATE ON players FOR EACH ROW EXECUTE FUNCTION set_updated_at_to_now();
CREATE INDEX apps_created_at_index ON apps (created_at);
CREATE TRIGGER update_apps_updated_at BEFORE UPDATE ON apps FOR EACH ROW EXECUTE FUNCTION set_updated_at_to_now();
