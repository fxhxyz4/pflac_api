const LST = document.querySelector(".main__source");
const USER_NAME = "M-it-2";

const localGetUser = () => {
  const repos = JSON.parse(localStorage.getItem("repos"));

  if (!repos || repos.length === 0) {
    firstGetUser(USER_NAME).then(fetchedRepos => {
      if (fetchedRepos) {
        displayRepos(fetchedRepos);
      }
    });

    return;
  }

  displayRepos(repos);
}

document.addEventListener("DOMContentLoaded", localGetUser);

async function firstGetUser(username) {
  try {
    const res = await fetch(`https://api.github.com/users/${username}/repos`);

    if (!res.ok) {
      throw new Error('Error while fetch data');
    }

    const repos = await res.json();
    repos.sort((a, b) => a.name.localeCompare(b.name));

    let sliced = repos.slice(0, 5);
    localStorage.setItem("repos", JSON.stringify(sliced));

    return sliced;
  } catch (e) {
    console.error('Error: ', e);
  }
}

const displayRepos = (repos) => {
  repos.forEach(repo => {
    LST.insertAdjacentHTML("beforeend", `
      <li class="source__item">
        <a class="source__link" href="${repo.html_url}" target="_blank" rel="noopener noreferrer nofollow">${repo.name}</a>
      </li>
    `);
  });
}
