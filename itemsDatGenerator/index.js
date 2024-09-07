const START = 50000;

const fs = require("fs");
const customs = JSON.parse(fs.readFileSync("./input.json", "utf-8"));
let data = JSON.parse(fs.readFileSync("./RGT.json", "utf-8"));

(async()=>{
    const i = data.items.length;
    data.item_count = i + customs.length;
    customs.forEach(custom => {
        custom.item_id = (START + custom.item_id) - 1;
        data.items.push(custom);
    })
    fs.writeFileSync("./items.json", JSON.stringify(data, null, 2), "utf-8");
})();