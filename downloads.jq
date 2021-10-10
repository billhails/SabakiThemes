[
    .[].assets[] |
    {
        (
            .name |
            sub("(.sabakitheme.asar$)"; "") |
            sub("(semi-precious)"; "bathroom") |
            sub("(-soft$)"; "")
        ): .download_count
    }
] |
map(to_entries) |
add |
group_by(.key) |
map(
    {
        key: .[0].key,
        value: map(.value) | add
    }
) |
from_entries
