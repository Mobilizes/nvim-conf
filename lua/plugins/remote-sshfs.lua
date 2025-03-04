return {
  "nosduco/remote-sshfs.nvim",
  lazy = true,
  opts = {
    connections = {
      sshfs_args = { -- arguments to pass to the sshfs command
        "-o Compression=yes",
        "-o reconnect",
        "-o Ciphers=aes128-gcm@openssh.com",
        "-o auto_cache",
        "-o direct_io",
        "-o attr_timeout=3600",
        "-o kernel_cache",
      },
    },
  },
}
