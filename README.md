# Hangups

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Steps to reproduce

- [ ] Start the server
- [ ] Hit the `/` endpoint with an HTTP client
- [ ] Cancel the request with the HTTP client
- [ ] Observe the server logs to see it keep running
- [ ] Also note how it logs that it returned 200 even though the socket is closed

I don't see the error `Bandit.HTTPTransport.Bandit.HTTP1.Socket.request_error!/2` raise in this reproduction but that may be a lack of logging
