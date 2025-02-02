# NOTE: temporary for compatibility with `WORKSPACE` setup!
# TODO: remove when migration to `bzlmod` is complete

# this has to be split into `docs_dependencies_1` and `docs_dependencies_2`
# because Bazel is imperative, and requires `load()` to be a top-level
# statement.
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def docs_dependencies_1():
    """
    Load repositories required for rendering documentation for `rules_nixpkgs_*`
    """
    maybe(
        http_archive,
        "io_bazel_stardoc",
        sha256 = "6d07d18c15abb0f6d393adbd6075cd661a2219faab56a9517741f0fc755f6f3c",
        strip_prefix = "stardoc-0.4.0",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/stardoc/archive/0.4.0.tar.gz",
            "https://github.com/bazelbuild/stardoc/archive/0.4.0.tar.gz",
        ],
    )
    maybe(
        http_archive,
        "rules_sh",
        sha256 = "83a065ba6469135a35786eb741e17d50f360ca92ab2897857475ab17c0d29931",
        strip_prefix = "rules_sh-0.2.0",
        urls = ["https://github.com/tweag/rules_sh/archive/v0.2.0.tar.gz"],
    )
