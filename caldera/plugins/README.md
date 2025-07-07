```
find ./ -name *.yml -exec sed -i 's/172.18./172.16./g' {} +
find ~/caldera/plugins/stockpile/data/ -name tx*.yml -delete
cp -r ./data ~/caldera/plugins/stockpile
```
