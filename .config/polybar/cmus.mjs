import { execSync } from "node:child_process";

try {
  const cmusStatus = execSync("cmus-remote -C status").toString().split("\n");

  const status = cmusStatus.filter((line) => line.startsWith("status"))[0];

  const tags = Object.fromEntries(
    cmusStatus
      .filter((line) => line.startsWith("tag"))
      .map((line) => {
        const [tag, ...rest] = line.replace("tag ", "").split(" ");
        return [tag, rest.join(" ")];
      }),
  );

  tags.status = status.replace("status ", "");

  if (tags.status === "stopped") {
    console.log("  Not playing");
  } else if (tags.title || tags.artist) {
    const icon = tags.status === "paused" ? " " : " ";
    console.log(
      `${icon} ${tags.title ?? "Unknown"} - ${tags.artist ?? "unknown"}`,
    );
  }
} catch {}
