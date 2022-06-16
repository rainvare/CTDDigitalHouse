const jsonData= require('./response_ability.json'); 

function search(textToSearch)
{
    //var textToSearch='static';
    for(let pokeName of jsonData.results){
        if (pokeName.name == textToSearch) {
        //pm.expect(pokeName.name).to.eql(textToSearch);
            console.log("ID found: " + pokeName.name);
            console.log("URLd: " + pokeName.url);
            break;
        }
        else
        {
            console.log("Not found: " + pokeName.name);
        }
    }
}

search('static');

let poke1 = jsonData.results.find(a => a.name === 'static');

console.log("ID found with find in array: " + poke1.name);
console.log("URL: " + poke1.url)
console.log(typeof(poke1.name));