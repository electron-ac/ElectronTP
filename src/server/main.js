const logoInput =
    "5F5F5F5F5F5F205F2020202020205F5F5F5F5F5F205F5F5F5F5F205F5F5F5F5F5F5F205F5F5F5F5F2020205F5F5F5F20205F2020205F2020205F5F5F5F5F5F5F205F5F5F5F5F2020200A7C20205F5F5F5F7C207C202020207C20205F5F5F5F2F205F5F5F5F7C5F5F2020205F5F7C20205F5F205C202F205F5F205C7C205C207C207C207C5F5F2020205F5F7C20205F5F205C200A7C207C5F5F20207C207C202020207C207C5F5F207C207C202020202020207C207C20207C207C5F5F29207C207C20207C207C20205C7C207C202020207C207C20207C207C5F5F29207C0A7C20205F5F7C207C207C202020207C20205F5F7C7C207C202020202020207C207C20207C20205F20202F7C207C20207C207C202E2060207C202020207C207C20207C20205F5F5F2F200A7C207C5F5F5F5F7C207C5F5F5F5F7C207C5F5F5F7C207C5F5F5F5F2020207C207C20207C207C205C205C7C207C5F5F7C207C207C5C20207C202020207C207C20207C207C20202020200A7C5F5F5F5F5F5F7C5F5F5F5F5F5F7C5F5F5F5F5F5F5C5F5F5F5F5F7C20207C5F7C20207C5F7C20205C5F5C5C5F5F5F5F2F7C5F7C205C5F7C202020207C5F7C20207C5F7C2020202020";

const _log = console.log;
const logger = {
    log: (...params) => {
        _log("^4[LOG]^0", ...params);
    },

    warn: (...params) => {
        _warn("^2[WARN]^0", ...params);
    },
    error: (...params) => {
        _error("^1[ERROR]^0", ...params);
    },
    write: (...params) => {
        _log(...params);
    },
    writeCenter(text, width) {
        _log(
            " ".repeat(Math.max(Math.round(width / 2 - text.length / 2), 0)) +
                text
        );
    },
};

on("ElectronTP:initialize", (integration) => {
    const logoText = Buffer.from(logoInput, "hex").toString("ascii");
    const textOffset = 3;
    const logoLength = Math.round(
        Math.max(0, ...logoText.split("\n").map((l) => l.length + textOffset))
    );

    logger.write("^6 Electron Services presents...^0");
    logger.write("^4");
    logger.write(logoText);
    logger.write("^0");
    logger.writeCenter("^3Welcome to Electron Trigger Protector^0", logoLength);
    if (integration) {
        logger.writeCenter(
            "^3ElectronAC integration is ^1active^0",
            logoLength
        );
    } else {
        logger.writeCenter(
            "^3ElectronAC integration is ^1not installed^3, players won't be banned automatically^0",
            logoLength
        );
        logger.writeCenter(
            "^3Install it here:https://electron-ac.com/^0",
            logoLength
        );
    }
    logger.write("");
});
