import { Akord, Auth } from "@akord/akord-js";

const email = "goodsun@bon-soleil.com";
const pass = "HondaJazzAAc09";

const { wallet } = await Auth.signIn(email, pass).catch((e) => {
  deleteFile(eoa);
  console.log("wallet取得エラー");
});
const akord = await Akord.init(wallet).catch((e) => {
  deleteFile(eoa);
  console.log("akord取得エラー");
});

const vaults = await akord.vault.listAll();
vaults.forEach(async (vault) => {
  if (vault.name == "publicMetaDatas") {
    const file = "./datadir/dummy.jpg";
    console.log("vault ID:" + vault.id);
    console.log("vault name:" + vault.name);
    const { stackId, uri } = await akord.stack.create(vault.id, file);
    console.log(stackId);
    console.log(uri);
  }
});

// console.dir(stackId);
// console.dir(uri);
