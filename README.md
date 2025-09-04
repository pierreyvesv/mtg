# mtg

magic the gathering  notes and thought about Pioneer

Github link

<https://github.com/pierreyvesv/mtg>

## setup ruby
``` 
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm use ruby-2.7.0  #--default
bundle install
bundle update
```

## push updates

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_pyverdon_ymail_com
```
bundle exec jekyll build
bundle exec jekyll serve
