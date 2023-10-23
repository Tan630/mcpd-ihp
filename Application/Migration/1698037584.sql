CREATE TABLE play (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    consent BOOLEAN NOT NULL,
    play_data JSONB NOT NULL,
    player_name TEXT NOT NULL,
    app_name TEXT NOT NULL
);
