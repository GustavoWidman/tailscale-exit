FROM tailscale/tailscale:latest

COPY ./auth.key /
COPY ./config.sh /

WORKDIR /

# Ensure the script is executable
RUN chmod +x /config.sh

# Execute script at runtime instead of build time
CMD ["sh", "/config.sh"]